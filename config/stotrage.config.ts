export const StorageConfig = {
    photoDestination: '../storage/photos/',
    photoMaxFileSize: 1024 * 1024 * 3, // u bajtovima => 1024 * 1024 * 3 = 3MB (sto je zapravo i puno za jednu sliku, ali neka ostane)
    photoThumbSize: { width: 120, height: 100 },
    photoSmallSize: { width: 320, height: 240 },
};