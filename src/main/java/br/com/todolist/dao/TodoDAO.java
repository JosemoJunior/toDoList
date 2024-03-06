package br.com.todolist.dao;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.todolist.model.Todo;

// TODO: Auto-generated Javadoc
/**
 * The Class TodoDAO.
 */
@Repository
public class TodoDAO {

    /** The todos. */
    private static List<Todo> todos;
	
    /** The entity manager. */
    @PersistenceContext
    private EntityManager entityManager;
    
    /**
     * Instantiates a new todo DAO.
     */
    public TodoDAO() {
		this.todos = new LinkedList<Todo>();
	}
    
    /**
     * Salvar.
     *
     * @param todo the todo
     */
    // Insert
    @Transactional(readOnly=false)
    public void salvar(Todo todo) {
        entityManager.persist(todo);
    }
    
    /**
     * Gets the all.
     *
     * @return the all
     */
    @Transactional(readOnly = true)
    public List<Todo> getAll() {
        String jpql = "from Todo t where t.statusTarefa = false order by t.dateTarefa"; 
        TypedQuery<Todo> consulta = entityManager.createQuery(jpql, Todo.class);

        return consulta.getResultList();
    }   
    
    /**
     * Gets the id.
     *
     * @param id the id
     * @return the id
     */
    // Select where
    public Todo getId(Long id) {
        return entityManager.find(Todo.class, id);
    }
    
    /**
     * Gets the atrasadas.
     *
     * @return the atrasadas
     */
    @Transactional(readOnly = true)
    public List<Todo> getAtrasadas() {
        String jpql = "from Todo t where t.dateTarefa < :hoje and t.statusTarefa = false order by t.dateTarefa";
        TypedQuery<Todo> consulta = entityManager.createQuery(jpql, Todo.class);
        consulta.setParameter("hoje", new Date());
        return consulta.getResultList();
    }
    
    /**
     * Gets the concluidas.
     *
     * @return the concluidas
     */
    @Transactional(readOnly = true)
    public List<Todo> getConcluidas() {
        String jpql = "from Todo t where t.statusTarefa = true order by t.dateTarefa";
        TypedQuery<Todo> consultaConcluidas = entityManager.createQuery(jpql, Todo.class);
        return consultaConcluidas.getResultList();
    }

    /**
     * Editar.
     *
     * @param todo the todo
     */
    // Update where
    @Transactional(readOnly=false)
    public void editar(Todo todo) {
        entityManager.merge(todo);
    }
    
    /**
     * Concluir tarefa.
     *
     * @param id the id
     */
    // Concluir tarefa
    @Transactional(readOnly=false)
    public void concluirTarefa(Long id) {
        Todo todo = getId(id);
        if (todo != null) {
            todo.setStatusTarefa(!todo.isStatusTarefa()); 
            entityManager.merge(todo);
        }
    }

    /**
     * Excluir.
     *
     * @param id the id
     */
    // Delete
    @Transactional(readOnly=false)
    public void excluir(Long id) {
        Todo todo = getId(id);
        entityManager.remove(todo);
    }
}
