Then 'get all anime with name = {string}' do |name|
    World.find_by(name: name)
end

Then 'get all anime' do
    World.all
end

Then 'get all anime \'evidenza\'' do
    evidenza = ['One Piece', 'Black Clover', 'Dragon Ball Heroes', 'Detective Conan', 'Boruto: Naruto Next Generations']
    list = World.in(name:evidenza)
end

Then 'get all anime \'suggeriti\'' do
    suggeriti = ['One Piece Movie 12: Z','Nanatsu no Taizai', 'Bungou Stray Dogs', 'Fairy Tail', 'Guilty Crown','Dr. Stone','Quanzhi Gaoshou','Btooom!','Zetsuen no Tempest','Fullmetal Alchemist','Angel Beats!','Bokura ga Ita','Naruto','Pandora Hearts','Piano no Mori (TV)']
    list = World.in(name:suggeriti)
end
