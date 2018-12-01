
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class HandyWorker extends Endorsable {

	//------------Atributos---------

	private String					make;

	//-------------Relaciones---------

	private Curriculum				curriculum;
	private Finder					finder;
	private Collection<Tutorial>	tutorials;
	private Collection<WorkPlan>	workPlans;


	//-------------Getters y Setters----

	@Valid
	@OneToOne(optional = true)
	public Curriculum getCurriculum() {
		return this.curriculum;
	}

	public void setCurriculum(final Curriculum curriculum) {
		this.curriculum = curriculum;
	}

	@NotBlank
	@NotNull
	public String getMake() {
		return this.make;
	}

	public void setMake(final String make) {
		this.make = make;
	}

	@Valid
	@OneToOne(optional = false)
	public Finder getFinder() {
		return this.finder;
	}

	public void setFinder(final Finder finder) {
		this.finder = finder;
	}

	@NotNull
	@OneToMany(mappedBy = "handyWorker")
	public Collection<Tutorial> getTutorials() {
		return this.tutorials;
	}

	public void setTutorials(final Collection<Tutorial> tutorials) {
		this.tutorials = tutorials;
	}

	@NotNull
	@OneToMany(mappedBy = "handyWorker")
	public Collection<WorkPlan> getWorkPlans() {
		return this.workPlans;
	}

	public void setWorkPlans(final Collection<WorkPlan> workPlans) {
		this.workPlans = workPlans;
	}

}
