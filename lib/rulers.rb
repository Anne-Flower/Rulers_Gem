require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      # Ignore les requêtes pour /favicon.ico => erreur
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      klass, act = get_controller_and_action(env) # Récupère le contrôleur et l'action
      controller = klass.new(env) # Instancie le contrôleur
      text = controller.send(act) # Appelle l'action
      [200, { 'Content-Type' => 'text/html' }, [text]] # Renvoie la réponse HTTP
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env   
      @env
    end
  end
end
