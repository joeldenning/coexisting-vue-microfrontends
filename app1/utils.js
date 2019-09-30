function isLocal() {
	return process.env.NODE_ENV === 'local';
}


module.exports = {
	isLocal,
};
