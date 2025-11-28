import { EmailService } from "../utils/Email";

export const sendDonationEmail = async (
  email,
  name,
  amount,
  status,
  remarks = ""
) => {
  console.log("status", status, status === "Verified");
  const subject =
    status === "Verified"
      ? "Thank You for Your Blessed Contribution to Hew Foundation"
      : "Important Update Regarding Your Donation";

  const heading =
    status === "Verified"
      ? "Your Generosity Creates Hope!"
      : "Donation Status Update";

  const message =
    status === "Verified"
      ? `Your generous contribution to <strong>Hew Foundation</strong> is a beacon of hope. Your support enables us to continue our mission of serving humanity and creating positive change in our community. May Allah reward you abundantly for your kindness.`
      : `Thank you for considering <strong>Hew Foundation</strong> for your charitable giving. We appreciate your intention to support our cause. However, we couldn't process your donation at this time. Please feel free to reach out to us for any clarification.`;

  const buttonLabel =
    status === "Verified" ? "View Our Impact" : "Contact Support";

  const buttonLink =
    status === "Verified"
      ? "https://hewfoundation.org.pk/"
      : "mailto:support@hewfoundation.org.pk";

  await EmailService.sendEmail({
    to: email,
    subject,
    text: message,
    html: `
      <div style="font-family: 'Segoe UI', Arial, sans-serif; padding: 30px; background: linear-gradient(135deg, #fff9e6 0%, #fff5d6 100%);">
        <div style="max-width: 600px; margin: 0 auto; background: #ffffff; padding: 40px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);">
          
          <!-- Header with Logo -->
          <div style="text-align: center; margin-bottom: 35px;">
            <img src="https://hewfoundation.org.pk/wp-content/uploads/2023/02/cropped-cropped-logo-73x73.jpeg" alt="Hew Foundation" style="max-width: 180px; margin-bottom: 20px;">
            <div style="width: 80px; height: 3px; background: linear-gradient(90deg, #e67e22, #f1c40f); margin: 0 auto;"></div>
          </div>
          
          <!-- Main Heading -->
          <h1 style="color: #e67e22; text-align: center; font-size: 32px; margin-bottom: 30px; font-weight: 600;">${heading}</h1>
          
          <!-- Greeting & Message -->
          <p style="font-size: 17px; color: #555; line-height: 1.7; margin-bottom: 25px;">
            Assalam-o-Alaikum <strong>${name}</strong>,
          </p>
          <p style="font-size: 17px; color: #555; line-height: 1.7; margin-bottom: 30px;">
            ${message}
          </p>

          <!-- Donation Details Box -->
          <div style="background: linear-gradient(135deg, #fff9f0 0%, #fff5e6 100%); 
                      border-left: 5px solid #e67e22; 
                      padding: 25px; 
                      margin: 30px 0; 
                      border-radius: 12px;
                      box-shadow: 0 3px 15px rgba(230, 126, 34, 0.08);">
            <h3 style="color: #d35400; margin: 0 0 20px 0; font-size: 22px;">Donation Details</h3>
            <div style="display: grid; grid-template-columns: auto 1fr; gap: 12px; color: #666;">
              <strong>Amount:</strong>
              <span>PKR ${amount}</span>
              <strong>Status:</strong>
              <span style="color: ${
                status === "Verified" ? "#27ae60" : "#e74c3c"
              }">${status}</span>
              ${
                remarks
                  ? `
                <strong>Remarks:</strong>
                <span>${remarks}</span>
              `
                  : ""
              }
            </div>
          </div>

          <!-- CTA Button -->
          <div style="text-align: center; margin: 35px 0;">
            <a href="${buttonLink}" 
               style="display: inline-block; 
                      background: linear-gradient(135deg, #e67e22 0%, #f1c40f 100%);
                      color: #ffffff; 
                      padding: 16px 40px; 
                      text-decoration: none; 
                      border-radius: 30px; 
                      font-size: 17px; 
                      font-weight: 500;
                      box-shadow: 0 4px 15px rgba(230, 126, 34, 0.2);
                      transition: all 0.3s ease;">
              ${buttonLabel}
            </a>
          </div>

          <!-- Footer -->
          <div style="text-align: center; margin-top: 40px; padding-top: 30px; border-top: 2px solid #fff3e0;">
            <h2 style="color: #e67e22; font-size: 24px; font-weight: 600; margin-bottom: 10px;">
              Hew Foundation
            </h2>
            <p style="color: #666; font-size: 15px; margin-bottom: 15px;">
              Together We Rise, Together We Serve
            </p>
            <div style="margin-top: 20px;">
              <a href="https://facebook.com/hewfoundation" style="text-decoration: none; color: #666; margin: 0 10px;">Facebook</a>
              <a href="https://instagram.com/hewfoundation" style="text-decoration: none; color: #666; margin: 0 10px;">Instagram</a>
              <a href="tel:+923042344502" style="text-decoration: none; color: #666; margin: 0 10px;">Contact</a>
            </div>
            <p style="color: #999; font-size: 13px; margin-top: 20px;">
              © ${new Date().getFullYear()} Hew Foundation. All rights reserved.
            </p>
          </div>

        </div>
      </div>
    `,
  }).catch((error) => {
    console.error("Failed to send donation email:", error);
  });
};
