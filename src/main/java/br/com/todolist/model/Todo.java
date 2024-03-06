package br.com.todolist.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Nonnull;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "todos")
public class Todo implements Serializable {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false, length = 100)
	private String titulo;
	
	private boolean statusTarefa;
	
	@Nonnull
	@Column(name = "data_tarefa")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateTarefa;
	
	@Nonnull
	@Column(columnDefinition = "TEXT", nullable = false)
	private String descricaoTarefa;

	public Todo() {}

	public Todo(Long id, String titulo, boolean statusTarefa, Date dateTarefa, String descricaoTarefa) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.statusTarefa = statusTarefa;
		this.dateTarefa = dateTarefa;
		this.descricaoTarefa = descricaoTarefa;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public boolean isStatusTarefa() {
		return statusTarefa;
	}

	public void setStatusTarefa(boolean statusTarefa) {
		this.statusTarefa = statusTarefa;
	}
	
	public Date getDateTarefa() {
		return dateTarefa;
	}

	public void setDateTarefa(Date dateTarefa) {
		this.dateTarefa = dateTarefa;
	}

	public String getDescricaoTarefa() {
		return descricaoTarefa;
	}

	public void setDescricaoTarefa(String descricaoTarefa) {
		this.descricaoTarefa = descricaoTarefa;
	}
	
	public String getFormattedDateTarefa() {
	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	    return dateTarefa != null ? sdf.format(dateTarefa) : "";
	}
	//aqui
	@Transient
    public boolean isAtrasada() {
        if (dateTarefa == null || statusTarefa) {
            // Se a data da tarefa é nula ou a tarefa está concluída, não está atrasada
            return false;
        }
        Date hoje = new Date();
        return dateTarefa.before(hoje);
    }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Todo other = (Todo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}