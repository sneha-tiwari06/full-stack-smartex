import cloudinary from 'cloudinary';

// Configure Cloudinary (replace 'your_cloud_name', 'your_api_key', and 'your_api_secret' with your actual Cloudinary credentials)
cloudinary.config({
  cloud_name: 'dryuta8qr',
  api_key: '864788981112861',
  api_secret: 'PJLmf4kK9GNaK6j0ae2031_wkR0'
});

// Function to upload image to Cloudinary and send to API
const uploadFileToCloud = async (imageFile) => {
  try {
    // Upload image to Cloudinary
    const cloudinaryResponse = await cloudinary.v2.uploader.upload(imageFile, { folder: 'smartex_image' });

    // Now you can send the image URL along with other data to your API
    const imageData = {
      imageUrl: cloudinaryResponse.secure_url,
      
    };

    // Send imageData to your API using fetch or axios
    // Example with fetch:
    const response = await fetch('https://api.cloudinary.com/v1_1/dryuta8qr/image/upload', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(imageData)
    });

    // Handle response from API
    if (response.ok) {
      const responseData = await response.json();
      console.log('Image uploaded and sent to API:', responseData);
      return responseData;
    } else {
      console.error('Failed to send image to API');
      throw new Error('Failed to send image to API');
    }
  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
};

export default uploadFileToCloud;