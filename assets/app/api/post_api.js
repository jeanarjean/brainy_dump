const auth_token = localStorage.brainy_dump ? JSON.parse(localStorage.brainy_dump).auth_token : "";

export default {
    get_post(id, callback) {
        fetch('http://localhost:4000/api/posts/' + id, {
            method: 'GET', // or 'PUT'
            headers: new Headers({
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token
            })
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    get_posts(callback) {
        fetch('http://localhost:4000/api/posts', {
            method: 'GET', // or 'PUT'
            headers: new Headers({
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token

            })
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    update_post(data, callback) {
        fetch('http://localhost:4000/api/posts/' + data.id, {
            method: 'PUT',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token

            }
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    create_post(data, callback) {
        fetch('http://localhost:4000/api/posts', {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token

            }
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    update_post(data, callback) {
        fetch('http://localhost:4000/api/posts/' + data.id, {
            method: 'PUT',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token

            }
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    delete_post(data, callback) {
        fetch('http://localhost:4000/api/posts/' + data.id, {
            method: 'DELETE',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token

            }
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
}