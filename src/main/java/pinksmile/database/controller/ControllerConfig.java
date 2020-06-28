package pinksmile.database.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.resource.ResourceUrlProvider;

/**
 *  使用ResourceUrlProvider进行版本管理
 *  并避免在版本发生改变时，由于浏览器缓存而产生资源版本未改变的错误
 */
@ControllerAdvice
public class ControllerConfig {

    private final ResourceUrlProvider resourceUrlProvider;

    public ControllerConfig(ResourceUrlProvider resourceUrlProvider) {
        this.resourceUrlProvider = resourceUrlProvider;
    }

    @ModelAttribute("urls")
    public ResourceUrlProvider urls() {
        return this.resourceUrlProvider;
    }

}
