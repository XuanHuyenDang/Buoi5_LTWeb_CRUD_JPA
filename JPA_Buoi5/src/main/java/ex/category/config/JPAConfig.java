package ex.category.config;

import jakarta.persistence.*;

public class JPAConfig {
	private static EntityManagerFactory factory;

	static {
		factory = Persistence.createEntityManagerFactory("my-persistence-unit");
	}

	public static EntityManager getEntityManager() {
		return factory.createEntityManager();
	}

	public static void shutdown() {
		if (factory != null) {
			factory.close();
		}
	}
}
