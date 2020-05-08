export const StorageConfig = {
    photo: {
        destination: '../storage/photos/',
        maxSize: 1024 * 1024 * 3, // u bajtovima => 1024 * 1024 * 3 = 3MB (sto je zapravo i puno za jednu sliku, ali neka ostane)
        resize: {
            thumb: {
                width: 120, 
                height: 100,
                directory: 'thumb/'
            },
            small: {
                width: 320, 
                height: 240,
                directory: 'small/'
            },
        }
    }
};