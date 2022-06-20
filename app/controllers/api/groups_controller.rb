module Api
  class GroupsController

    def index
      # authorize Group
      groups = Group.all
      render json: groups, status: :ok
    end

    def create
      group = Group.new(set_group_params)
      authorize group
      render json: group
    end

    def update
      group = Group.find(params[:id])
      authorize group
      group.update(set_group_params)
      render json: group
    end

    def destroy
      group = Group.find(params[:id])
      authorize group
      group.destroy
      render json: group
    end

    private
    def set_group_params
      params.permit(:name,:account_group_ids)
    end
  end
end
