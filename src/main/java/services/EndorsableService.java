
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.EndorsableRepository;
import security.LoginService;
import security.UserAccount;
import domain.Endorsable;

@Service
@Transactional
public class EndorsableService {

	//--------------------Managed Repositories-------------------------

	@Autowired
	private EndorsableRepository	endorsableRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------

	// Simple CRUD methods ----------------------------------------------------
	public Endorsable findOne(final int endorsableId) {
		Assert.isTrue(endorsableId != 0);
		Endorsable res;
		res = this.endorsableRepository.findOne(endorsableId);
		Assert.notNull(res);
		return res;
	}

	public Collection<Endorsable> findAll() {
		Collection<Endorsable> res;
		res = this.endorsableRepository.findAll();
		Assert.notNull(res);
		return res;
	}

	public Endorsable save(final Endorsable endorsable) {
		Endorsable res;
		res = this.endorsableRepository.save(endorsable);
		return res;

	}

	public Endorsable findPrincipal() {
		final UserAccount userAccount = LoginService.getPrincipal();
		return this.endorsableRepository.findOneByUserAccount(userAccount.getId());
	}
}
