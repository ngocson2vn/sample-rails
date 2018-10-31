if Rails.env.development?
	Clientoken.setup do |config|
	  config.administoken_master_token = '34b5d93a0b6040aa9c5490c580ddf0bf751f445ab605f654f3873ea8cf8054a17dc23e9ce4b1798fa3c475cd9dd95b7b4119bde2e1b7dc0f6fa970a68255d675'
	end
end
