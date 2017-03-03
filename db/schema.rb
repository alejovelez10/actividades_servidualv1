# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170303144708) do

  create_table "actividads", force: :cascade do |t|
    t.integer  "consecutivo"
    t.string   "tipo"
    t.integer  "user_id"
    t.string   "prioridad"
    t.integer  "responsable_id"
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "anexo"
    t.date     "f_entrega"
    t.integer  "porcentaje"
    t.boolean  "estado_cierre"
    t.boolean  "estado_envio"
    t.integer  "contador"
    t.string   "codigo"
    t.string   "e_vencimiento"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "actividads_users", id: false, force: :cascade do |t|
    t.integer "actividad_id"
    t.integer "user_id"
    t.index ["actividad_id"], name: "index_actividads_users_on_actividad_id"
    t.index ["user_id"], name: "index_actividads_users_on_user_id"
  end

  create_table "seguimientos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "actividad_id"
    t.integer  "descripcion"
    t.integer  "porcentaje"
    t.boolean  "cierre"
    t.string   "anexo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "rol"
    t.string   "avatar"
    t.string   "f_nacimiento"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
