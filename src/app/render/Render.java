package app.render;

import java.util.List;

import org.springframework.ui.ModelMap;

public class Render {
	private String js; // {js}
	private String img; // {img}
	private String css; // {css}
	private String title;
	private String default_layout;
	private String body;
	private String file_css;

	public String getJs() {
		return js;
	}

	public void setJs(String js) {
		this.js = js;
	}

	public String getImg() {
		return img;
	}

	public String getFile_css() {
		return file_css;
	}

	public void setFile_css(String file_css) {
		this.file_css = file_css;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getDefault_layout() {
		return default_layout;
	}

	public void setDefault_layout(String default_layout) {
		this.default_layout = default_layout;
	}

	// Constructor
	public Render(String js, String img, String css, String body) {
		super();
		this.js = js;
		this.img = img;
		this.css = css;
		this.body = body;
	}

	public Render() {
		this.js = "public/js";
		this.css = "public/css";
		this.img = "public/img";
		this.file_css = "home.css";
		this.body = "";
		this.title = "Title";
		this.default_layout = "main";
	}

	// Res.render
	public String render(ModelMap model, String body, String title) {
		model.addAttribute("img", this.img);
		model.addAttribute("css", this.css);
		model.addAttribute("js", this.js);
		model.addAttribute("file_css", this.file_css);
		model.addAttribute("body", body);
		model.addAttribute("title", title);
		return this.default_layout;

	}
}
