export default {
    get_posts(callback) {
        fetch('http://localhost:4000/api/posts', {
            method: 'GET', // or 'PUT'
            headers: new Headers({
                'Content-Type': 'application/json'
            })
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    create_post(data, callback) {
        fetch('http://localhost:4000/api/posts', {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
}