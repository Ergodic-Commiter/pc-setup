module.exports = {
  plugins: ['sort-keys'],
  rules: {
    'sort-keys/sort-keys': [
      'error', 'asc', {
        caseSensitive: true,
        natural: false, 
        order: [
          'type', 'style', 'template', 'powerline_symbol', 
          'background', 'foreground', 'properties'] } ]
  }
}