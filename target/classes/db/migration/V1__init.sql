create table users (
  id                    bigserial,
  username              varchar(30) not null unique,
  password              varchar(80) not null,
  email                 varchar(50) unique,
  primary key (id)
);

create table roles (
  id                    serial,
  name                  varchar(50) not null,
  primary key (id)
);

create table acceses (
  id                    serial,
  title                 varchar(50) not null,
  primary key (id)
);

CREATE TABLE users_roles (
  user_id               bigint not null,
  role_id               int not null,
  primary key (user_id, role_id),
  foreign key (user_id) references users (id),
  foreign key (role_id) references roles (id)
);

CREATE TABLE roles_acceses (
  role_id               bigint not null,
  access_id               int not null,
  primary key (role_id, access_id),
  foreign key (role_id) references users (id),
  foreign key (access_id) references access (id)
);

insert into roles (name)
values
('ROLE_USER'), ('ROLE_ADMIN'), ('ROLE_READER'), ('SUPERADMIN');

insert into acceses(title)
values
('READ_PAGES'), ('CHANGE_FIELD'), ('CREATE_ORDERS');

insert into users (username, password, email)
values
('user', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'user@gmail.com');

insert into users_roles (user_id, role_id)
values
(1, 1),
(1, 2);

insert into roles_access (role_id, access_id)
values
(1, 1),
(1, 3),
(3, 1);