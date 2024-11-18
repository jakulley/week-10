DROP TABLE project_category IF EXISTS;
DROP TABLE material IF EXISTS;
DROP TABLE step IF EXISTS;
DROP TABLE category IF EXISTS;
DROP TABLE project IF EXISTS;

CREATE TABLE project (
	project_id INT NOT NULL,
	project_name VARCHAR(64) NOT NULL,
	estimated_hours FLOAT(24) NOT NULL,
	actual_hours FLOAT(24) DEFAULT NULL,
	difficulty VARCHAR(32) NOT NULL,
	notes VARCHAR(256) DEFAULT NULL,
	PRIMARY KEY (project_id)
);

CREATE TABLE category (
	category_id INT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE step (
	step_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
	step_text VARCHAR(256) NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id)
);

CREATE TABLE material (
	material_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
	material_name VARCHAR(64) NOT NULL,
	num_required INT NOT NULL,
	cost FLOAT(24) NOT NULL,
	PRIMARY KEY (material_id)
);

CREATE TABLE project_category (
	project_id INT,
	category_id INT,
	PRIMARY KEY (project_id, category_id),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);