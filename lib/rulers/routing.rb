module Rulers
  class Application
    def get_controller_and_action(env)
      # Découpe l'URL pour obtenir le contrôleur et l'action
      _, cont, action, _ = env["PATH_INFO"].split("/", 4)
      cont = cont.capitalize
      cont += "Controller" # Exemple : "people" -> "PeopleController"
      
      [Object.const_get(cont), action]
    end
  end
end
