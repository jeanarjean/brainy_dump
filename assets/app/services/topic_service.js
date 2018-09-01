export default {
    get_topics(callback) {
        fetch('http://localhost:4000/api/topics', {
                method: 'GET', // or 'PUT'
                headers: new Headers({
                    'Content-Type': 'application/json'
                })
            }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => callback(response))
    }
}