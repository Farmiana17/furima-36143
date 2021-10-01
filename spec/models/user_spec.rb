require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do

    context '新規登録できるとき' do

      it 'nickname、email、password、encrypted_password、last_name、first_name、last_name_kana、first_name_kana、birthdayを入力すれば登録ができる' do
        expect(@user).to be_valid
      end

    end

    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it 'emailが既に登録されていると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it 'emailが@を含んでいなければ登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.encrypted_password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it 'passwordが半角英数字が混合していないと登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  is invalid. Include both letters and numbers")
      end
      
      it 'passwordがencrypted_passwordと一致しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it 'last_nameが全角ひらがな・カタカナ・漢字でなければ登録できない' do
        @user.last_name = 'ＴＯＭ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      
      it 'first_nameが全角ひらがな・カタカナ・漢字でなければ登録できない' do
        @user.first_name = 'ＴＯＭ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end

  end

end

  #describe 'ログイン/ログアウト' do

    #it '' do
    #end

    #it '' do
    #end

    #it '' do
    #end

    #it '' do
    #end

  #end

      #it '正しい情報を入力すれば、新規登録ができてトップページに移動する' do
        #トップページに移動する
        #visit root_path

        #トップページに新規登録ボタンがある
        #expect(page).to have_content('新規登録')

        #新規登録ページに移動する
        #visit new_user_registration_path

        #ユーザー情報を入力する
        #fill_in 'ニックネーム', with: @user.nickname
        #fill_in 'メールアドレス', with: @user.email
        #fill_in 'パスワード', with: @user.password
        #fill_in 'パスワード(確認用)', with: @user.encrypted_password
        #fill_in 'お名前(全角)・姓', with: @user.last_name
        #fill_in 'お名前(全角)・名', with: @user.first_name
        #fill_in 'お名前カナ(全角)・姓', with: @user.last_name_kana
        #fill_in 'お名前カナ(全角)・名', with: @user.first_name_kana        
        #fill_in '生年月日', with: @user.birthday

        #登録ボタンを押すとユーザーモデルのカウントが1上がる
        #expect{find('input[name="commit"]').click}.to change{User.count}.by(1)

        #トップページに移動したことを確認する
        #expect(current_path).to eq(root_path)

        #トップページにログアウトボタンがある
        #expect(page).to have_content('ログアウト')

        #新規登録ページに移動するボタンや、ログインページに移動するボタンが表示されていない
        #expect(page).to have_no_content('新規登録')
        #expect(page).to have_no_content('ログイン')
      #end