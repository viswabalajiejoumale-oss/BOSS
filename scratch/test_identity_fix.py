import requests

url = 'https://nulmpvolwjhdacmtxcyg.supabase.co/auth/v1/signup'
headers = {
    'apikey': 'sb_publishable_eOqokYGq7KMQp3gGyTiutg_mvImT46I',
    'Content-Type': 'application/json'
}

# Test sign in with st901@boss.com
login_url = 'https://nulmpvolwjhdacmtxcyg.supabase.co/auth/v1/token?grant_type=password'
login_data = {'email': 'st901@boss.com', 'password': 'Viswa123#'}
rl = requests.post(login_url, headers=headers, json=login_data)
print('Login st901 status:', rl.status_code)
print('Login response:', rl.text)
