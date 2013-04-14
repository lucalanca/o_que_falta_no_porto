class RenameIdeasToProblems < ActiveRecord::Migration
	def self.up
		rename_table :ideas, :problems
	end
     def self.down
        rename_table :ideas, :problems
     end
end
