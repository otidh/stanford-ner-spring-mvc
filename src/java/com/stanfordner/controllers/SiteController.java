package com.stanfordner.controllers;

import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.stanford.nlp.ie.AbstractSequenceClassifier;
import edu.stanford.nlp.ie.crf.*;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.ling.CoreAnnotations;

import java.util.List;
import org.json.simple.JSONObject;

@Controller
@RequestMapping(value = "/")
public class SiteController {

	@RequestMapping(value = "", method = RequestMethod.GET)
	public @ResponseBody
	String NERtagging(String keyword, HttpServletRequest request) {
		
		String prevWord = "", prevWordClass = "O";
		
		String defaultS = "The ceremonies will be attended by other invited royals and high-ranking dignitaries, including Britain's Prince Charles and the Duchess of Cornwall, Prince Felipe and Princess Letizia of Spain and Denmark's Crown Prince Frederik and his wife. "
			+ "About a million visitors are also set to pour into Amsterdam, and street parties are planned across the nation.";
		
		// json to return
		JSONObject obj = new JSONObject();
		
		// output tags
		Map tags = new HashMap();
		ArrayList<String> person = new ArrayList<String>(); // PERSON
		ArrayList<String> location = new ArrayList<String>(); // LOCATION
		ArrayList<String> time = new ArrayList<String>(); // TIME
		ArrayList<String> organization = new ArrayList<String>(); // ORGANIZATION
		ArrayList<String> money = new ArrayList<String>(); // MONEY
		ArrayList<String> percent = new ArrayList<String>(); // PERCENT
		ArrayList<String> date = new ArrayList<String>(); // DATE
		
		// assign the arrays with the corresponding tag names
		tags.put("PERSON", person);
		tags.put("LOCATION", location);
		tags.put("TIME", time);
		tags.put("ORGANIZATION", organization);
		tags.put("MONEY", money);
		tags.put("PERCENT", percent);
		tags.put("DATE", date);

		// cacth the input
		String s = request.getParameter("s") == null ? defaultS : request.getParameter("s");
		
		String serializedClassifier = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/classifiers/english.muc.7class.distsim.crf.ser.gz");

		AbstractSequenceClassifier<CoreLabel> classifier = CRFClassifier.getClassifierNoExceptions(serializedClassifier);

		List<List<CoreLabel>> out = classifier.classify(s);
		for (List<CoreLabel> sentence : out) {
			System.out.println(sentence.toString());
			
			for (CoreLabel word : sentence) {
				String wordClass = word.get(CoreAnnotations.AnswerAnnotation.class);
				
				System.out.print(word.word() + '/' + wordClass + ' ');
				
				if (!prevWordClass.equalsIgnoreCase("O")) {
					if (!prevWordClass.equalsIgnoreCase(wordClass)) {
						((ArrayList) tags.get(prevWordClass)).add(prevWord);
					} else {
						prevWord += " " + word.word(); 
					}
				} else {
					prevWord = word.word();
				}
					
				prevWordClass = wordClass;
			}
			
			System.out.println();
			
			prevWord = ""; 
			prevWordClass = "O";
		}

		obj.put("person", person);
		obj.put("location", location);
		obj.put("time", time);
		obj.put("organization", organization);
		obj.put("money", money);
		obj.put("percent", percent);
		obj.put("date", date);
		
		return obj.toJSONString();
	}
}