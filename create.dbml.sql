table customers {
  id bigint [pk, not null, increment]
  code varchar
  name varchar
  address text
  customer_classe_id bigint [not null]
  prefecture_id bigint [not null]
}

table customer_classes {
  id bigint [pk, not null, unique ]
  name varchar
}

table prefectures {
  id bigint [pk, not null, unique ]
  name varchar
}

ref: "prefectures"."id" < "customers"."prefecture_id"
ref: "customer_classes"."id" < "customers"."customer_classe_id"

table categories {
  id bigint [pk, not null, unique ]
  name varchar
}

table products {
  id bigint [pk, not null, unique ]
  code varchar
  name varchar
  price float
  categorie_id bigint [not null]
}

ref: "categories"."id" < "products"."categorie_id"

table sales {
  id bigint [pk, not null, increment]
  quantity float
  customer_id bigint [not null]
  product_id bigint [not null]
  employee_id bigint [not null]
  sold_at datetime
}

table employees {
  id bigint [pk, not null, increment]
  name varchar
  height float
  weight float
  email varchar
  hired_year int
  birthday datetime
  blood_type varchar
}

table departments {
  id bigint [pk, not null, unique]
  name varchar
}

table belongtos {
  id bigint [pk, not null, increment]
  employee_id bigint [not null]
  department_id bigint [not null]
  started_at datetime
  ended_at datetime
}

table salaries {
  id bigint [pk, not null, increment]
  employee_id bigint [not null]
  paied_at datetime
  amount float
}


ref: "customers"."id" < "sales"."customer_id"
ref: "products"."id" < "sales"."product_id"
ref: "employees"."id" < "sales"."employee_id"
ref: "departments"."id" < "belongtos"."department_id"
ref: "employees"."id" < "belongtos"."employee_id"
ref: "employees"."id" < "salaries"."employee_id"

