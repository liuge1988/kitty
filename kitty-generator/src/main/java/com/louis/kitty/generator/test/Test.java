package com.louis.kitty.generator.test;

import java.io.IOException;

import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.resource.ClasspathResourceLoader;

public class Test {

	public static void main(String[] args) throws IOException {
		ClasspathResourceLoader resourceLoader = new ClasspathResourceLoader("templates");
		Configuration cfg = Configuration.defaultConfiguration();
		GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
		Template t = gt.getTemplate("/model.btl");
		t.binding("cfg", cfg);
		String str = t.render();
		System.out.println(str);
	}
}
