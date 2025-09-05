package ex.category.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

import ex.category.config.JPAConfig;
import ex.category.entity.Category;

public class CategoryDAO {
	public Category create(Category cate) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(cate);
			em.getTransaction().commit();
			return cate;
		} finally {
			em.close();
		}
	}

	public Category update(Category cate) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			em.getTransaction().begin();
			cate = em.merge(cate);
			em.getTransaction().commit();
			return cate;
		} finally {
			em.close();
		}
	}

	public void remove(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			em.getTransaction().begin();
			Category cate = em.find(Category.class, id);
			if (cate != null)
				em.remove(cate);
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	public Category findById(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			return em.find(Category.class, id);
		} finally {
			em.close();
		}
	}

	public List<Category> findAll() {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			TypedQuery<Category> query = em.createQuery("SELECT c FROM Category c", Category.class);
			return query.getResultList();
		} finally {
			em.close();
		}
	}
}
