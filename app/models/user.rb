class User < ActiveRecord::Base
  is_indexed :fields => ["name", "city", "state"]
   ####################################################################
 # validates_presence_of     :password, :if => :password_required?
 # validates_presence_of     :password_confirmation, :if => :password_required?
  #validates_length_of       :password, :within => 4..40, :if => :password_required?
  #validates_confirmation_of :password, :if => :password_required?
  #with_options :if => :password_required? do
  #  validates_presence_of     :password
  #  validates_length_of       :password, :within => 4..20
  #  validates_confirmation_of :password
  #end
  validates_presence_of :name,:address,:city,:state,:zipcode,:username,:phone,:email,:user_type,:user_to_do
  validates_format_of  :name,:city,:username,:with => /^([a-zA-Z])/, :on => :create
   validates_numericality_of  :zipcode
  validates_length_of   :zipcode, :within => 5..5
  validates_uniqueness_of   :username, :email
  validates_length_of       :email, :within => 5..100
  validates_format_of       :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_presence_of     :password,              :if => :password_required?
  validates_presence_of     :password_confirmation, :if => :password_required?
  validates_length_of       :password, :within => 5..30,
                                       :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?

  has_attached_file :photo,:styles => {:thumb=> "100x100#",:small  => "150x150>" }
 # validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']




   protected
   
   def self.encrypt(password)
    Crypto::Key.from_file("#{RAILS_ROOT}/rsa_key.pub").encrypt(password)
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password)
  end


   def encrypt_password
      return if password.blank?
      self.password = encrypt(password)
    end

  def password_required?
      (password.blank? ) || !password.blank? || !verify_password.nil?
    end
end
