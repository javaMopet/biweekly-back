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

ActiveRecord::Schema[7.0].define(version: 2023_05_13_215944) do
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

  create_table "categorias", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.string "icono", limit: 50
    t.string "descripcion"
    t.string "color", limit: 20
    t.bigint "cuenta_contable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tipo_movimiento_id", null: false
    t.bigint "cuenta_id"
    t.integer "orden", default: 1000, null: false
    t.decimal "importe", precision: 10, scale: 4, default: 0.0, null: false
    t.index ["cuenta_contable_id"], name: "index_categorias_on_cuenta_contable_id"
    t.index ["cuenta_id"], name: "index_categorias_on_cuenta_id"
    t.index ["tipo_movimiento_id"], name: "index_categorias_on_tipo_movimiento_id"
  end

  create_table "cfdis", force: :cascade do |t|
    t.string "uuid"
    t.string "rfc_emisor"
    t.string "rfc_receptor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuentas", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "descripcion"
    t.bigint "cuenta_contable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tipo_cuenta_id", null: false
    t.decimal "saldo", precision: 10, scale: 4
    t.index ["cuenta_contable_id"], name: "index_cuentas_on_cuenta_contable_id"
    t.index ["tipo_cuenta_id"], name: "index_cuentas_on_tipo_cuenta_id"
  end

  create_table "cuentas_contable", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "tipo_afectacion", limit: 1
    t.integer "subnivel"
    t.bigint "padre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["padre_id"], name: "index_cuentas_contable_on_padre_id"
  end

  create_table "detalles_movimiento", force: :cascade do |t|
    t.bigint "movimiento_id", null: false
    t.bigint "categoria_id"
    t.bigint "cuenta_id"
    t.decimal "importe", precision: 10, scale: 4
    t.string "tipo_afectacion", limit: 1
    t.string "tipo_detalle", limit: 1
    t.bigint "cuenta_contable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_detalles_movimiento_on_categoria_id"
    t.index ["cuenta_contable_id"], name: "index_detalles_movimiento_on_cuenta_contable_id"
    t.index ["cuenta_id"], name: "index_detalles_movimiento_on_cuenta_id"
    t.index ["movimiento_id"], name: "index_detalles_movimiento_on_movimiento_id"
  end

  create_table "egresos", force: :cascade do |t|
    t.bigint "categoria_id", null: false
    t.bigint "cuenta_id", null: false
    t.string "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_egresos_on_categoria_id"
    t.index ["cuenta_id"], name: "index_egresos_on_cuenta_id"
  end

  create_table "estados_movimiento", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados_registro", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingresos", force: :cascade do |t|
    t.bigint "categoria_id", null: false
    t.bigint "cuenta_id", null: false
    t.string "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_ingresos_on_categoria_id"
    t.index ["cuenta_id"], name: "index_ingresos_on_cuenta_id"
  end

  create_table "inversiones", force: :cascade do |t|
    t.bigint "categoria_id", null: false
    t.bigint "cuenta_id", null: false
    t.string "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_inversiones_on_categoria_id"
    t.index ["cuenta_id"], name: "index_inversiones_on_cuenta_id"
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

  create_table "movimientos", force: :cascade do |t|
    t.integer "numero"
    t.bigint "estado_movimiento_id", null: false
    t.bigint "tipo_movimiento_id", null: false
    t.date "fecha"
    t.string "observaciones", limit: 300
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_movimiento_id"], name: "index_movimientos_on_estado_movimiento_id"
    t.index ["tipo_movimiento_id"], name: "index_movimientos_on_tipo_movimiento_id"
    t.index ["user_id"], name: "index_movimientos_on_user_id"
  end

  create_table "registros", force: :cascade do |t|
    t.bigint "estado_registro_id", null: false
    t.string "registrable_type", limit: 100
    t.bigint "registrable_id"
    t.decimal "importe", precision: 10, scale: 4
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_registro_id"], name: "index_registros_on_estado_registro_id"
  end

  create_table "registros_tarjeta", force: :cascade do |t|
    t.date "fecha"
    t.string "concepto"
    t.bigint "categoria_id", null: false
    t.decimal "importe", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_registros_tarjeta_on_categoria_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos_cuenta", force: :cascade do |t|
    t.string "nombre", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icono", limit: 30
  end

  create_table "tipos_movimiento", force: :cascade do |t|
    t.string "nombre", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icono", limit: 50
  end

  create_table "transferencias", force: :cascade do |t|
    t.bigint "cuenta_origen_id", null: false
    t.bigint "cuenta_destino_id", null: false
    t.string "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuenta_destino_id"], name: "index_transferencias_on_cuenta_destino_id"
    t.index ["cuenta_origen_id"], name: "index_transferencias_on_cuenta_origen_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categorias", "cuentas"
  add_foreign_key "categorias", "cuentas_contable"
  add_foreign_key "categorias", "tipos_movimiento"
  add_foreign_key "cuentas", "cuentas_contable"
  add_foreign_key "cuentas", "tipos_cuenta"
  add_foreign_key "cuentas_contable", "cuentas_contable", column: "padre_id"
  add_foreign_key "detalles_movimiento", "categorias"
  add_foreign_key "detalles_movimiento", "cuentas"
  add_foreign_key "detalles_movimiento", "cuentas_contable"
  add_foreign_key "detalles_movimiento", "movimientos"
  add_foreign_key "egresos", "categorias"
  add_foreign_key "egresos", "cuentas"
  add_foreign_key "ingresos", "categorias"
  add_foreign_key "ingresos", "cuentas"
  add_foreign_key "inversiones", "categorias"
  add_foreign_key "inversiones", "cuentas"
  add_foreign_key "movimientos", "estados_movimiento"
  add_foreign_key "movimientos", "tipos_movimiento"
  add_foreign_key "movimientos", "users"
  add_foreign_key "registros", "estados_registro"
  add_foreign_key "registros_tarjeta", "categorias"
  add_foreign_key "transferencias", "cuentas", column: "cuenta_destino_id"
  add_foreign_key "transferencias", "cuentas", column: "cuenta_origen_id"
end
