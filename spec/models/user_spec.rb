require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとsecond_nameとfirst_nameとsecond_kanaとfirst_kanaとbirthdayとemailとpasswordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'second_nameが空では登録できないこと' do
      @user.second_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名を入力してください')
    end
    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('姓を入力してください')
    end
    it 'second_kanaが空では登録できないこと' do
      @user.second_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名を入力してください')
    end
    it 'first_kanaが空では登録できないこと' do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('姓を入力してください')
    end
    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('誕生日を入力してください')
    end
    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end
    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'emailに一意性があること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'emailは@を含んでいること' do
      @user.email = 'aiueo'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'passwordは６文字以上であること' do
      @user.password = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordは英数字混合であること' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字を混ぜてください')
    end
    it 'ユーザー本名（姓）は全角（漢字・ひらがな・カタカナ）であること' do
      @user.second_name = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('名には全角文字を使用してください')
    end
    it 'ユーザー本名（名）は全角（漢字・ひらがな・カタカナ）であること' do
      @user.first_name = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓には全角文字を使用してください')
    end
    it 'ユーザー本名（姓）のフリガナが全角（カタカナ）であること' do
      @user.second_kana = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('名には全角カタカナを使用してください')
    end
    it 'ユーザー本名（名）のフリガナが全角（カタカナ）であること' do
      @user.first_kana = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓には全角カタカナを使用してください')
    end
  end
end
