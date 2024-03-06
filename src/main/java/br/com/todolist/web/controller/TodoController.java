package br.com.todolist.web.controller;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.hash.Hashing;

import br.com.todolist.dao.TodoDAO;
import br.com.todolist.model.Todo;

@Controller
public class TodoController {

	@Autowired
	private TodoDAO dao;
	String token;
	
	@RequestMapping(value = "/exibirtarefa", method = RequestMethod.POST)
    public ModelAndView processaTarefa(@ModelAttribute Todo todo, @RequestParam String token) {
        ModelAndView view = new ModelAndView("formtarefa");
        if(this.token.equals(token)) {
        dao.salvar(todo);
        view.addObject("mensagem", todo.getTitulo() + " foi adicionada com sucesso!");

        }

        else {
			view.addObject("mensagem", "Hacker Detectado!");
		}
        
        Random rand = new Random();
		String sha256hex = Hashing.sha256()
				.hashString(Integer.toString(rand.nextInt()), 
						StandardCharsets.UTF_8).toString();
		this.token = sha256hex;
		view.addObject("token", this.token);
        view.addObject("todos", dao.getAll());
		return view;
    }

    @RequestMapping(value = "/exibirtarefa", method = RequestMethod.GET)
    public ModelAndView exibirFormTarefa(Model model) {
        model.addAttribute("todo", new Todo());
        ModelAndView view = new ModelAndView("formtarefa");
        
        Random rand = new Random();
		String sha256hex = Hashing.sha256()
				.hashString(Integer.toString(rand.nextInt()), 
						StandardCharsets.UTF_8).toString();
		this.token = sha256hex;

		
        view.addObject("todos", dao.getAll());
        view.addObject("mensagem", "Digite os detalhes da tarefa nos campos indicados");
        view.addObject("token", this.token);
        return view;
    }
    
    @RequestMapping(value = "/tarefasatrasadas", method = RequestMethod.GET)
    public ModelAndView exibirTarefasAtrasadas(Model model) {
        ModelAndView view = new ModelAndView("tarefasatrasadas");

        List<Todo> tarefasAtrasadas = dao.getAtrasadas();
        view.addObject("tarefasAtrasadas", tarefasAtrasadas);

        return view;
    }
    
    @RequestMapping(value = "/tarefasconcluidas", method = RequestMethod.GET)
    public ModelAndView exibirTarefasConcluidas(Model model) {
        ModelAndView view = new ModelAndView("tarefasconcluidas");

        List<Todo> tarefasConcluidas = dao.getConcluidas();
        view.addObject("tarefasConcluidas", tarefasConcluidas);

        return view;
    }
    
    @GetMapping(value = "/concluir/{id}")
    public String concluirTarefa(@PathVariable Long id, Model model) {
    	dao.concluirTarefa(id);
        return "redirect:../exibirtarefa";
    }

    @GetMapping(value = "/excluir/{id}")
    public String excluirTarefa(@PathVariable Long id, Model model) {
    	dao.excluir(id);
        return "redirect:../exibirtarefa";
    }
    
    @GetMapping(value = "/editar/{id}")
    public ModelAndView editarTarefa(@PathVariable Long id, Model model) {
        ModelAndView view = new ModelAndView("editartarefa");
        model.addAttribute("todo", dao.getId(id));
        
        Random rand = new Random();
		String sha256hex = Hashing.sha256()
				.hashString(Integer.toString(rand.nextInt()), 
						StandardCharsets.UTF_8).toString();
		this.token = sha256hex;
		view.addObject("token", this.token);
        return view;
    }

    @PostMapping(value = "/update/{id}")
    public String atualizarTarefa(@PathVariable Long id, @ModelAttribute Todo todo, @RequestParam String token) {
    	
    	if(this.token.equals(token)) {
    		dao.editar(todo);
    		return "redirect:../exibirtarefa";
    	} else {
    		return "redirect:../tokeninvalido";
    	}	
        
    }
    
    @RequestMapping(value = "/tokeninvalido", method = RequestMethod.GET)
    public ModelAndView exibemensagem(Model model) {
        ModelAndView view = new ModelAndView("tokeninvalido");
        view.addObject("mensagem", "Hacker Detectado!");
        return view;
    }
	
}