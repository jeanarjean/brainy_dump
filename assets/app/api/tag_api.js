export default {
    get_tags(callback) {
        fetch('http://localhost:4000/api/tags/', {
            method: 'GET', // or 'PUT'
            headers: new Headers({
                'Content-Type': 'application/json'
            })
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    },
    get_tag(id, callback) {
        fetch('http://localhost:4000/api/tags/' + id, {
            method: 'GET', // or 'PUT'
            headers: new Headers({
                'Content-Type': 'application/json'
            })
        }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    }
}