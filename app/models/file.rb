class File < ApplicationRecord
    # this sets up the model to accept incoming files inside files parameter.
    has_many_attached :files 
end