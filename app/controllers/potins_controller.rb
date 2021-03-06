class PotinsController < ApplicationController
  def index
    @potins = Potin.all
  end 


  def show
    @potins = Potin.find(params[:id])
  end

  def new
    @potin = Potin.new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    u = User.last
    @potin = Potin.new(title: params[:title], content: params[:content], user: u)

    if @potin.save
      redirect_to potins_path
      flash[:notice] = "Achievement unlocked : Ca potine dur !"
    else 
      render new_potin_path

    end
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    @potin = Potin.find(params[:id])

    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @potin = Potin.find(params[:id])
    post_params = params.require(:potin).permit(:title, :content)
    @potin.update(post_params)
    redirect_to potins_path
  end
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)


    def destroy
      @potins = Potin.find(params[:id])
      @potins.destroy
      redirect_to potins_path
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end 
end

