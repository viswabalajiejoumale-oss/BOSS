-- Fix existing users in auth.users by setting NULL token columns to empty strings
UPDATE auth.users
SET 
  confirmation_token = '',
  recovery_token = '',
  email_change_token_new = '',
  email_change_token_current = '',
  email_change = '',
  reauthentication_token = '',
  phone_change = '',
  phone_change_token = ''
WHERE confirmation_token IS NULL;
