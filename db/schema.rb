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

ActiveRecord::Schema.define(version: 20160918220745) do

  create_table "bootsy_image_galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "bootsy_resource_type"
    t.integer  "bootsy_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "fantasy_name"
    t.string   "company_name"
    t.text     "description_company",    limit: 65535
    t.string   "cnpj"
    t.string   "sector_compny"
    t.string   "company_size"
    t.string   "zipcode"
    t.string   "state"
    t.string   "city"
    t.string   "district"
    t.string   "address"
    t.string   "number"
    t.string   "complement"
    t.string   "telphone1"
    t.string   "telphone2"
    t.string   "website"
    t.index ["email"], name: "index_companies_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree
  end

  create_table "curriculos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "status",                   default: 0
    t.text     "obs",        limit: 65535
    t.integer  "type_cv",                  default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["user_id"], name: "index_curriculos_on_user_id", using: :btree
  end

  create_table "facebook_posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text     "content",       limit: 65535
    t.boolean  "posted",                      default: false
    t.string   "id_face"
    t.string   "email_empresa"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "integrate",                   default: false
    t.integer  "type_post",                   default: 0
    t.string   "email_user"
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "job_applies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_applies_on_job_id", using: :btree
    t.index ["user_id"], name: "index_job_applies_on_user_id", using: :btree
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title"
    t.string   "email"
    t.string   "name_offerer"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.string   "district"
    t.string   "address"
    t.string   "complement"
    t.string   "workload"
    t.decimal  "price",                           precision: 8, scale: 2
    t.string   "type_offer"
    t.string   "experience"
    t.string   "occupation"
    t.string   "office"
    t.text     "description",       limit: 65535
    t.text     "responsibilities",  limit: 65535
    t.text     "requirements",      limit: 65535
    t.text     "differential",      limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.string   "slug"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "status",                                                  default: 0
    t.boolean  "closed",                                                  default: false
    t.boolean  "owner",                                                   default: false
    t.string   "contract"
    t.string   "scholarity"
    t.datetime "schedule_time"
    t.boolean  "schedule_type",                                           default: false
    t.boolean  "posted",                                                  default: false
    t.datetime "posted_at"
    t.string   "number"
    t.boolean  "job_verify",                                              default: false
    t.datetime "end_date"
    t.boolean  "end_date_type"
    t.index ["user_id"], name: "index_jobs_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id"
    t.decimal  "amount",       precision: 8, scale: 2
    t.integer  "days"
    t.integer  "order_status"
    t.boolean  "active"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "premia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "days"
    t.decimal  "price",      precision: 8, scale: 2
    t.boolean  "status",                             default: true
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "name"
    t.string   "office"
    t.text     "about",                  limit: 65535
    t.string   "date_of_birth"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.string   "district"
    t.string   "address"
    t.string   "complement"
    t.string   "website"
    t.string   "phone"
    t.string   "facebook"
    t.string   "github"
    t.string   "googleplus"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "pinterest"
    t.string   "instagram"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cpf"
    t.string   "cv_pdf_file_name"
    t.string   "cv_pdf_content_type"
    t.integer  "cv_pdf_file_size"
    t.datetime "cv_pdf_updated_at"
    t.boolean  "admin",                                default: false
    t.integer  "type_user",                            default: 0
    t.string   "slug"
    t.string   "cnpj"
    t.string   "company_name"
    t.string   "number"
    t.boolean  "status",                               default: true
    t.text     "message_status",         limit: 65535
    t.boolean  "user_verify",                          default: false
    t.datetime "premium_expires"
    t.boolean  "user_premium",                         default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "curriculos", "users"
  add_foreign_key "job_applies", "jobs"
  add_foreign_key "job_applies", "users"
  add_foreign_key "orders", "users"
end
