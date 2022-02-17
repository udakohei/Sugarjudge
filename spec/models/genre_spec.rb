require 'rails_helper'

RSpec.describe Genre, type: :model do
  it 'is valid with name' do
    genre = build(:genre)
    expect(genre).to be_valid
  end

  it 'is invalid without name' do
    genre_without_name = build(:genre, name: '')
    expect(genre_without_name).to be_invalid
    expect(genre_without_name.errors[:name]).to include 'を入力してください'
  end

  it 'is valid with unique name' do
    genre = create(:genre)
    genre_with_unique_name = build(:genre)
    expect(genre_with_unique_name).to be_valid
  end

  it 'is invalid with duplicate name' do
    genre = create(:genre)
    genre_with_duplicate_name = build(:genre, name: genre.name)
    expect(genre_with_duplicate_name).to be_invalid
    expect(genre_with_duplicate_name.errors[:name]).to include 'はすでに存在します'
  end
end
