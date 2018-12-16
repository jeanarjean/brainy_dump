const auth_token = localStorage.brainy_dump ? JSON.parse(localStorage.brainy_dump).auth_token : "";

export default {
    get_tags(callback) {
        fetch('/api/tags/', {
            method: 'GET', // or 'PUT'
            headers: new Headers({
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token

            })
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    get_tag(id, callback) {
        fetch('/api/tags/' + id, {
            method: 'GET', // or 'PUT'
            headers: new Headers({
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token

            })
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    update_tag(data, callback) {
        fetch('/api/tags/' + data.id, {
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
    create_tag(data, callback) {
        fetch('/api/tags', {
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
    delete_tag(data, callback) {
        fetch('/api/tags/' + data.id, {
            method: 'DELETE',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer: ' + auth_token

            }
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    }
}
