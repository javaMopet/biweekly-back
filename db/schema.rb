# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_04_25_011433) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bancos", force: :cascade do |t|
    t.string "nombre"
    t.string "icono", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", default: 1, null: false
    t.index ["user_id"], name: "index_bancos_on_user_id"
  end

  create_table "categorias", force: :cascade do |t|
    t.bigint "tipo_movimiento_id", null: false
    t.integer "orden", null: false
    t.string "nombre", limit: 200, null: false
    t.string "icono", limit: 50
    t.string "descripcion", limit: 1000
    t.string "color", limit: 20
    t.bigint "cuenta_contable_id"
    t.bigint "cuenta_default_id"
    t.decimal "importe_default", precision: 10, scale: 4, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", default: 1, null: false
    t.bigint "instance_id", default: 1, null: false
    t.index ["cuenta_contable_id"], name: "index_categorias_on_cuenta_contable_id"
    t.index ["cuenta_default_id"], name: "index_categorias_on_cuenta_default_id"
    t.index ["instance_id"], name: "index_categorias_on_instance_id"
    t.index ["tipo_movimiento_id"], name: "index_categorias_on_tipo_movimiento_id"
    t.index ["user_id"], name: "index_categorias_on_user_id"
  end

  create_table "clasificaciones", force: :cascade do |t|
    t.string "nombre"
    t.string "color"
    t.bigint "instance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instance_id"], name: "index_clasificaciones_on_instance_id"
  end

  create_table "cortes_cuenta", force: :cascade do |t|
    t.decimal "saldo_inicial", precision: 10, scale: 4
    t.decimal "saldo_final", precision: 10, scale: 4
    t.date "fecha_inicial"
    t.date "fecha_final"
    t.string "estatus", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuentas", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "identificador", limit: 10
    t.bigint "tipo_cuenta_id", null: false
    t.bigint "cuenta_contable_id"
    t.bigint "banco_id"
    t.decimal "saldo", precision: 10, scale: 4, default: 0.0, null: false
    t.integer "dia_corte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "propietario", limit: 80
    t.integer "dias_gracia", default: 0, null: false
    t.bigint "instance_id", default: 1, null: false
    t.bigint "user_id", default: 1, null: false
    t.index ["banco_id"], name: "index_cuentas_on_banco_id"
    t.index ["cuenta_contable_id"], name: "index_cuentas_on_cuenta_contable_id"
    t.index ["instance_id"], name: "index_cuentas_on_instance_id"
    t.index ["tipo_cuenta_id"], name: "index_cuentas_on_tipo_cuenta_id"
    t.index ["user_id"], name: "index_cuentas_on_user_id"
  end

  create_table "cuentas_contable", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "tipo_afectacion", limit: 1
    t.integer "subnivel"
    t.bigint "padre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instance_id", default: 1, null: false
    t.index ["instance_id"], name: "index_cuentas_contable_on_instance_id"
    t.index ["padre_id"], name: "index_cuentas_contable_on_padre_id"
  end

  create_table "estados_registro", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados_registro_tarjeta", force: :cascade do |t|
    t.string "nombre", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instances", force: :cascade do |t|
    t.string "name", null: false
    t.string "logo_image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dominio", limit: 20
  end

  create_table "invoices", force: :cascade do |t|
    t.string "name"
    t.string "name_file"
    t.binary "xml_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "menus", force: :cascade do |t|
    t.string "nombre", limit: 30
    t.string "icono", limit: 30
    t.string "ruta", limit: 150
    t.integer "padre", limit: 2
    t.boolean "tiene_hijos"
    t.integer "orden", limit: 2
    t.boolean "activo"
    t.string "ruta_vista"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagos_tarjeta", force: :cascade do |t|
    t.date "fecha"
    t.decimal "importe", precision: 12, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cuenta_id", default: 1, null: false
    t.index ["cuenta_id"], name: "index_pagos_tarjeta_on_cuenta_id"
  end

  create_table "registros", force: :cascade do |t|
    t.bigint "estado_registro_id", null: false
    t.string "tipo_afectacion", limit: 1, null: false
    t.decimal "importe", precision: 10, scale: 4, null: false
    t.date "fecha", null: false
    t.bigint "categoria_id"
    t.string "observaciones", limit: 1000
    t.bigint "cuenta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "tipo_cuenta_traspaso_id"
    t.bigint "registro_tarjeta_id"
    t.index ["categoria_id"], name: "index_registros_on_categoria_id"
    t.index ["cuenta_id"], name: "index_registros_on_cuenta_id"
    t.index ["estado_registro_id"], name: "index_registros_on_estado_registro_id"
    t.index ["registro_tarjeta_id"], name: "index_registros_on_registro_tarjeta_id"
    t.index ["tipo_cuenta_traspaso_id"], name: "index_registros_on_tipo_cuenta_traspaso_id"
    t.index ["user_id"], name: "index_registros_on_user_id"
  end

  create_table "registros_tarjeta", force: :cascade do |t|
    t.bigint "estado_registro_tarjeta_id", null: false
    t.bigint "cuenta_id", null: false
    t.bigint "categoria_id"
    t.string "tipo_afectacion", limit: 1, null: false
    t.decimal "importe", precision: 10, scale: 4
    t.date "fecha", null: false
    t.string "concepto", limit: 1000
    t.boolean "is_msi", default: false, null: false
    t.integer "numero_msi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pago_tarjeta_id"
    t.boolean "is_pago"
    t.index ["categoria_id"], name: "index_registros_tarjeta_on_categoria_id"
    t.index ["cuenta_id"], name: "index_registros_tarjeta_on_cuenta_id"
    t.index ["estado_registro_tarjeta_id"], name: "index_registros_tarjeta_on_estado_registro_tarjeta_id"
    t.index ["pago_tarjeta_id"], name: "index_registros_tarjeta_on_pago_tarjeta_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos_cuenta", force: :cascade do |t|
    t.string "nombre", limit: 50, null: false
    t.string "icono", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos_cuenta_traspaso", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos_movimiento", force: :cascade do |t|
    t.string "nombre", limit: 50
    t.string "icono", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traspaso_detalles", force: :cascade do |t|
    t.bigint "traspaso_id", null: false
    t.bigint "cuenta_id", null: false
    t.bigint "tipo_cuenta_traspaso_id"
    t.decimal "importe", precision: 11, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "registro_id", null: false
    t.index ["cuenta_id"], name: "index_traspaso_detalles_on_cuenta_id"
    t.index ["registro_id"], name: "index_traspaso_detalles_on_registro_id"
    t.index ["tipo_cuenta_traspaso_id"], name: "index_traspaso_detalles_on_tipo_cuenta_traspaso_id"
    t.index ["traspaso_id"], name: "index_traspaso_detalles_on_traspaso_id"
  end

  create_table "traspasos", force: :cascade do |t|
    t.date "fecha"
    t.string "observaciones", limit: 300
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instance_id", default: 1, null: false
    t.index ["instance_id"], name: "index_traspasos_on_instance_id"
    t.index ["user_id"], name: "index_traspasos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, where: "([reset_password_token] IS NOT NULL)"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "users_instances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "instance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instance_id"], name: "index_users_instances_on_instance_id"
    t.index ["user_id", "instance_id"], name: "index_users_instances_on_user_id_and_instance_id", unique: true
    t.index ["user_id"], name: "index_users_instances_on_user_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bancos", "users"
  add_foreign_key "categorias", "cuentas", column: "cuenta_default_id"
  add_foreign_key "categorias", "cuentas_contable"
  add_foreign_key "categorias", "instances"
  add_foreign_key "categorias", "tipos_movimiento"
  add_foreign_key "categorias", "users"
  add_foreign_key "clasificaciones", "instances"
  add_foreign_key "cuentas", "bancos"
  add_foreign_key "cuentas", "cuentas_contable"
  add_foreign_key "cuentas", "instances"
  add_foreign_key "cuentas", "tipos_cuenta"
  add_foreign_key "cuentas", "users"
  add_foreign_key "cuentas_contable", "cuentas_contable", column: "padre_id"
  add_foreign_key "cuentas_contable", "instances"
  add_foreign_key "pagos_tarjeta", "cuentas"
  add_foreign_key "registros", "categorias"
  add_foreign_key "registros", "cuentas"
  add_foreign_key "registros", "estados_registro"
  add_foreign_key "registros", "registros_tarjeta"
  add_foreign_key "registros", "tipos_cuenta_traspaso"
  add_foreign_key "registros", "users"
  add_foreign_key "registros_tarjeta", "categorias"
  add_foreign_key "registros_tarjeta", "cuentas"
  add_foreign_key "registros_tarjeta", "estados_registro_tarjeta"
  add_foreign_key "registros_tarjeta", "pagos_tarjeta"
  add_foreign_key "traspaso_detalles", "cuentas"
  add_foreign_key "traspaso_detalles", "registros"
  add_foreign_key "traspaso_detalles", "tipos_cuenta_traspaso"
  add_foreign_key "traspaso_detalles", "traspasos"
  add_foreign_key "traspasos", "instances"
  add_foreign_key "traspasos", "users"
  add_foreign_key "users_instances", "instances"
  add_foreign_key "users_instances", "users"
end
