package configuration;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceView;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages = {"controller"})
@EnableWebMvc
public class SpringMVCJavaConfig implements WebMvcConfigurer {
	
//	<mvc:resources mapping="/css/**" location="/css/" />
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/Login_v3/css/**").addResourceLocations("/Login_v3/css/");
		registry.addResourceHandler("/Login_v3/fonts/**").addResourceLocations("/Login_v3/fonts/");
		registry.addResourceHandler("/Login_v3/images/**").addResourceLocations("/Login_v3/images/");
		registry.addResourceHandler("/Login_v3/vendor/**").addResourceLocations("/Login_v3/vendor/");
		registry.addResourceHandler("/Login_v3/js/**").addResourceLocations("/Login_v3/js/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
		interceptor.setParamName("localeParam");
		registry.addInterceptor(interceptor);		
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(InternalResourceView.class);
//		resolver.setPrefix("/WEB-INF");
//		resolver.setSuffix(".xml");	
		registry.viewResolver(resolver);
	}

	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
		source.setBasename("controller.errors");	
		return source;
	}
	
	
	
	
}
