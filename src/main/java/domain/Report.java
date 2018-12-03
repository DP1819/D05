
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Report extends DomainEntity {

	//-----------Atributos-----------

	private Date				moment;
	private String				description;
	private Collection<Url>		attachments;
	private boolean				draft;

	//-----------Relaciones----------

	private Collection<Note>	notes;
	private Complaint			complaint;


	//----------Getters y Setters-------

	@Past
	@NotNull
	public Date getMoment() {
		return this.moment;
	}

	public void setMoment(final Date moment) {
		this.moment = moment;
	}

	@NotNull
	@OneToMany(mappedBy = "report", cascade = CascadeType.ALL)
	public Collection<Note> getNotes() {
		return this.notes;
	}

	public void setNotes(final Collection<Note> notes) {
		this.notes = notes;
	}

	@Valid
	@OneToOne(optional = false) 
	public Complaint getComplaint() {
		return this.complaint;
	}

	public void setComplaint(final Complaint complaint) {
		this.complaint = complaint;
	}

	@NotNull
	@ElementCollection
	public Collection<Url> getAttachments() {
		return this.attachments;
	}

	public void setAttachments(final Collection<Url> attachments) {
		this.attachments = attachments;
	}

	@NotBlank
	@NotNull
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	@NotNull
	public boolean getDraft() {
		return this.draft;
	}

	public void setDraft(final boolean draft) {
		this.draft = draft;
	}

}
