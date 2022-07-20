package com.gmprojects.vinylchum.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gmprojects.vinylchum.models.Vinyl;
import com.gmprojects.vinylchum.repositories.VinylRepository;

@Service
public class VinylService {

	@Autowired
    private VinylRepository vinylRepository;

    // returns all the vinyl records
    public List<Vinyl> allVinyls() {
        return vinylRepository.findAll();
    }
    
    // creates a vinyl record in the database
    public Vinyl createVinyl(Vinyl vinyl) {
        return vinylRepository.save(vinyl);
    }
    
    // updates a vinyl record entry
    public Vinyl updateVinyl(Vinyl vinyl) {
		return vinylRepository.save(vinyl);
	}
    
    // retrieves a vinyl by id
    public Vinyl findVinyl(Long id) {
        Optional<Vinyl> optionalVinyl = vinylRepository.findById(id);
        if(optionalVinyl.isPresent()) {
            return optionalVinyl.get();
        } else {
            return null;
        }
    }
    
}