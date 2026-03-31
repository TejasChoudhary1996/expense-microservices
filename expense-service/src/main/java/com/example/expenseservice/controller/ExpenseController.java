package com.example.expenseservice.controller;

import com.example.expenseservice.entity.Expense;
import com.example.expenseservice.service.ExpenseService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/expenses")
public class ExpenseController {

  private final ExpenseService service;

  public ExpenseController(ExpenseService service) {
    this.service = service;
  }

  @PostMapping
  public Expense create(@Valid @RequestBody Expense expense,
                        HttpServletRequest request) {

	  String userIdStr = request.getHeader("X-User-Id");
      if (userIdStr == null) {
          throw new RuntimeException("Unauthorized");
      }
      Long userId = Long.parseLong(userIdStr);
      System.out.println("inside create controller "+userId);
      
      expense.setUserId(userId);

      return service.save(expense);
  }

  @GetMapping
  public List<Expense> getAll(HttpServletRequest request) {
	  System.out.println("inside getAll controller");
	  String userIdStr = request.getHeader("X-User-Id");
      if (userIdStr == null) {
          throw new RuntimeException("Unauthorized");
      }
      Long userId = Long.parseLong(userIdStr);
      System.out.println("inside getAll controller "+userId);
      return service.getByUser(userId);
  }
}
