package configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import model.EmployeeBean;
import model.InventoryBean;
import model.MenuBean;
import model.RecipeBean;
import model.SalesBean;

@Configuration
@ComponentScan(basePackages = {"model","service"})
@EnableTransactionManagement
public class SpringJavaConfig {
	
		@Bean
		public PlatformTransactionManager transcationManager() {
			return new HibernateTransactionManager(sessionFactory());
			
		}
		@Bean
		public SessionFactory sessionFactory() {
			LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
			builder.addAnnotatedClass(EmployeeBean.class);
			builder.addAnnotatedClass(MenuBean.class);
			builder.addAnnotatedClass(SalesBean.class);
			builder.addAnnotatedClass(RecipeBean.class);
			builder.addAnnotatedClass(InventoryBean.class);
			
			Properties props = new Properties();
			props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
			props.setProperty("hibernate.show_sql", "true");
//			props.setProperty("hibernate.current_session_context_class", "thread");
			builder.addProperties(props);
			
			return builder.buildSessionFactory();
		}
		
		@Bean
		public DataSource dataSource() {
			HikariConfig config = new HikariConfig();
			config.setDriverClassName("com.mysql.jdbc.Driver");
			config.setJdbcUrl("jdbc:mysql://localhost:3306/java?useSSL=false");
			config.setUsername("root");
			config.setPassword("123456");
			config.addDataSourceProperty("cachePrepStmts", "true");
			config.addDataSourceProperty("prepStmtCacheSize", "250");
			config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

			return new HikariDataSource(config);			
			
//			try {
//				JndiObjectFactoryBean factory = new JndiObjectFactoryBean();
//				factory.setJndiName("java:comp/env/jdbc/hhh");
//				factory.setProxyInterface(DataSource.class);
//				factory.afterPropertiesSet();
//				return (DataSource) factory.getObject();
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//				throw new ExceptionInInitializerError(e);
//			}
			
		}
}
