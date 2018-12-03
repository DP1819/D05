
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.ProfessionalRecordRepository;
import security.Authority;
import domain.Curriculum;
import domain.ProfessionalRecord;

@Service
@Transactional
public class ProfessionalRecordService extends GenericService<ProfessionalRecord, ProfessionalRecordRepository> implements ServiceObjectDependantI<ProfessionalRecord, Curriculum> {

	// Repository
	
	@Autowired
	private ProfessionalRecordRepository	repository;

	// Services
	
	@Autowired
	private CurriculumService				curriculumService;
	@Autowired
	private ServiceUtils					serviceUtils;

	// CRUD methods

	@Override
	public Collection<ProfessionalRecord> findAll(final Curriculum dependency) {
		this.serviceUtils.checkId(dependency);
		Assert.notNull(this.curriculumService.findOne(dependency.getId()));
		return this.repository.findByCurriculumId(dependency.getId());
	}

	@Override
	public ProfessionalRecord create(final Curriculum dependency) {
		final ProfessionalRecord res = new ProfessionalRecord();
		res.setCurriculum(dependency);
		return res;
	}

	@Override
	public ProfessionalRecord save(final ProfessionalRecord object) {
		final ProfessionalRecord professionalRecord = super.checkObjectSave(object);
		if (object.getId() > 0)
			object.setCurriculum(professionalRecord.getCurriculum());
		this.serviceUtils.checkActor(professionalRecord.getCurriculum().getHandyWorker());
		this.serviceUtils.checkAuthority(Authority.HANDYWORKER);
		final ProfessionalRecord res = this.repository.save(object);
		return res;
	}

	@Override
	public void delete(final ProfessionalRecord object) {
		final ProfessionalRecord professionalRecord = super.checkObjectSave(object);
		this.serviceUtils.checkActor(professionalRecord.getCurriculum().getHandyWorker());
		this.serviceUtils.checkAuthority(Authority.HANDYWORKER);
		this.repository.delete(professionalRecord);
	}

	// Other methods
	
	public void flush() {
		this.repository.flush();
	}

}
