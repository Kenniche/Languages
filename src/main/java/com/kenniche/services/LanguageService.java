package com.kenniche.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kenniche.models.Language;
import com.kenniche.repositories.LanguageRepository;


@Service
public class LanguageService {
	
	private LanguageRepository langRepo;
	public LanguageService(LanguageRepository langRepo) {
		this.langRepo = langRepo;
	}
	
	public ArrayList<Language> getAll() {
		return (ArrayList<Language>) langRepo.findAll();
	}
	
	public Language create(Language newLanguage) {
		return langRepo.save(newLanguage);
	}

	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = langRepo.findById(id);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;			
		}
	}

	public Language updateLanguage(Language language) {
		return langRepo.save(language);
	}
	
	public void deleteLanguage(Long id) {
		langRepo.deleteById(id);
	}
}	
	