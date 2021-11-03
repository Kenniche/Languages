package com.kenniche.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kenniche.models.Language;
import com.kenniche.services.LanguageService;


@Controller
public class LanguageController {

	private LanguageService langService;
	
	public LanguageController(LanguageService langService) {
		this.langService = langService;
	}
	
	@GetMapping("/languages")
	public String index(Model model) {
		model.addAttribute("newLanguage", new Language()); // binds to form helper in index.jsp
		model.addAttribute("allLanguages", langService.getAll());
		return "Index.jsp";
	}
	
	@PostMapping("/languages")
	public String create(@Valid @ModelAttribute("newLanguage") Language newLanguage,
				BindingResult result, Model model) {
					if (result.hasErrors()) {
						model.addAttribute("allLanguages", langService.getAll());
						return "Index.jsp";
					}
					langService.create(newLanguage);
					return "redirect:/languages";
				}
	
	@GetMapping("/languages/{id}")
	public String details(Model model, @PathVariable("id") Long id) {
		Language languages = langService.findLanguage(id);
		model.addAttribute("language",languages);
		return "details.jsp";
	}
	
	@PutMapping("/languages/{id}")
	public Language update(@PathVariable("id") Long id, @RequestParam(value="name") String name, @RequestParam(value="creator") String creator, @RequestParam(value="currentVersion") double currentVersion) {
		Language language = langService.findLanguage(id);
		if (language != null) {
			language.setName(name);
			language.setCreator(creator);
			language.setCurrentVersion(currentVersion);
			langService.updateLanguage(language);
		}
		return language;
	}
	
	@GetMapping("/languages/{id}/edit")
	public String edit(@ModelAttribute("Language") Language Language, Model model, @PathVariable("id") Long id) {
		Language languages = langService.findLanguage(id);
		model.addAttribute("language",languages);
		return "edit.jsp";
	}
	
	@RequestMapping(value="/languages/{id}/edit", method=RequestMethod.PUT)
	public String edit(@Valid @ModelAttribute("Language") Language Language,
			BindingResult result, Model model, @PathVariable("id") Long id) {
		if (result.hasErrors()) {
			Language languages = langService.findLanguage(id);
			model.addAttribute("language",languages);
			return "edit.jsp";
		} else {
			return "redirect:/languages/{id}";
		}
	}
	
	@DeleteMapping("/languages/{id}")
	public String destroy(@PathVariable("id") Long id) {
		langService.deleteLanguage(id);
		return "redirect:/languages";
	}
	

}
