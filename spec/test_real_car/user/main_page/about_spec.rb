describe 'About', type: :feature do
  context 'Our Company tab ' do
  it 'is opened and text is present' do
    visit('https://staging.realcar.nyc/fleet')
    page.driver.browser.manage.window.resize_to(1500,1500)
    click_on ('About')
    click_on ('Our Company')
    expect(page).to have_content('ABOUT Real Car provides premium car rentals at competitive prices in the New York City metropolitan area. We offer convenient, personalized
     pick-up and delivery for our fleet of immaculately
     maintained vehicles. With Real Car, skip the trek to
     the garage, the polyester upholstery; drive in comfort
     and style—in your car, on your schedule.')

  end
end

context 'FAQ tab' do
  it 'is opened and text is present' do
    visit('https://staging.realcar.nyc/fleet')
    click_on ('About')
    click_on ('FAQ')
    expect(page).to have_content('FREQUENTLY ASKED QUESTIONS

What are the eligibility requirements?

You must be over 21-years old, and hold a current, valid (non-temporary) driver’s license (no major moving violations, DUI convictions, or similar infractions) and present your license to Real Car when you receive your vehicle.
If you are under the age of 25, you may be required to demonstrate at least two years of current, U.S.-licensed driving history.
If you hold a foreign licence, you must be at least 25 years old, and will be required to show your passport and a photograph of your license.
All renters must be physically present at the time of the rental. Unfortunately, Real Car does not allow 3rd parties to pick up vehicles, and our employees must physically hand the keys to the car’s driver.

What information is required of renters?

Payment card information : The renter must also provide their payment card information.
Driver’s license information : Every renter must submit his or her driver’s license number, in addition to the name and address on their driver’s license.
Identity verification questions : Real Car asks domestic applicants to provide the last four digits of their Social Security number, and may also ask them a few straightforward questions which they should be able to answer readily without reference to documentation to confirm their identity.
International Drivers:Non-US drivers are required to provide additional information, valid passport, and driver’s license from their home country.
Are my passengers allowed to drive? How do I add a driver?
Additional drivers may be listed on your Rental Agreement at no additional charge. Each additional driver must be present at the time of delivery, must submit a driver’s license in advance, and will be subject to the same age, licensing and driving-record restrictions as the primary renter.

May I have car Delivered / Pick-up?
You may choose to pick up / return your vehicle directly to your home, office, hotel, airport, or other location at no additional cost. Please note: All pickup & delivery arrangements must be confirmed at least 24 hours in advance in order to guarantee on-time service. Any changes to pickup or delivery times/locations with less than 24 hours notice may incur an additional transportation fee.

What times can i get car delivered?
Our normal delivery hours are between 9am and 9pm. Any deliveries outside of those hours must be pre-arranged with us. We’ll do our best to work around your schedule.

Can I extend my reservation?
Yes, you may, unless another renter has already booked the vehicle. If a trip is not extended and the vehicle is kept beyond the scheduled trip end time, you will be subject to significant late fees.

What are parking rules for street parked cars?
It is the renter’s responsibility to carefully check all signs on the street where the car is parked in order to ensure that the spot is valid for at least 12 hours. If the vehicle is towed and/or ticketed within 12 hours of the car being returned, the renter will be responsible for the towing fee, any applicable tickets that were received, and an administration fee of up to $25.

Do you have any cars that I may smoke in?
All of the cars in the Real Car fleet are strictly non-smoking.

Smoking Policy
Renters or their passengers are not permitted to smoke in any vehicle in the Real Car fleet. Real Car takes reports of smoking very seriously. If smoking is detected after a reservation has ended, the renter will face fines of up to $250. If the smell of smoke is detectable at the start of a reservation, please report it via email to hello@realcar.nyc (with subject line “Smell of smoking Prior to Reservation”) at the very beginning of your reservation so that you are not held responsible for the fee.

Do I get any money back if I end a reservation early?
You are charged for the full cost of the reservation regardless of when you return the car, so please plan your trip accordingly. Because we have a limited supply of vehicles, we pack the schedule very tightly. We offer a 24-hour grace period after you make your reservation to make changes or cancel (unless the rental is within 7 days), after which there will be a cancellation fee of 50% of the total rental cost, or $500 (whichever is greater). If you cancel or reschedule less than 7 days before your rental, you will be charged a cancellation fee of 100% of the total rental cost. If you do wish to return a vehicle early, please confirm it with us.

What uses of a Real Car vehicle are prohibited?

Our rental vehicles may not be used:

by anyone not licensed to drive or whose driver’s license has been suspended or restricted.
for any illegal purpose, or in connection with any illegal activity.
while the driver is under the influence of
alcohol above the legal limit or
any drug or medication under the effects of which the operation of a vehicle is prohibited or advised against.
to carry persons or property for hire.
to push or tow anything.
to exceed posted speed limits.
in any speed test, speed contest, race, rally, speed endurance contest, demonstration, or on or near any racetrack or road course.
to teach anyone to drive.
to the intention to cause damage, or with wanton, willful, or reckless disregard for safety.
on any unpaved surface.
Using vehicles without reservations or outside your reservation time constitutes unauthorized use.
when it has been loaded beyond its rated capacity or with more passengers than the vehicle has seat belts.
to transport any flammable, toxic, volatile, poisonous, dangerous or illegal substances.
Making any alterations, additions or improvements to any vehicle.
Smoking in the car.
Fueling a vehicle with an improper type of fuel.
In the event of a violation of these prohibited uses, we reserve the right to end your rental and retrieve the vehicle.

Can I drive out of the country?
Real Car rentals are allowed to be taken throughout North America only. Please note: Renters must communicate their intent to take the rental into Canada and receive consent from Real Car before booking your trip.

What happens if I receive a ticket?
The renter is responsible for all parking, traffic, speeding or other tickets or violations issued while the vehicle is being rented and must pay for any fees, penalties, towing charges, or impound costs. If you notify Real Car that you are going to take care of the ticket, you will not be charged any additional administration fees. If Real Car receives the ticket from a violation bureau, the credit card used for the reservation will be charged immediately for the amount of the ticket. You may be charged an additional fee.

Who is responsible for toll fees?
Renters are responsible for paying all toll fees incurred during their use of a rental. Failure to pay a toll properly will result in an administrative fee in addition to any charges associated with paying the toll fee. In the case that there is an all-electronic tollway with no way to pay manually, it is the responsibility of the renter to reimburse Real Car directly so the proper fee can be added to the rental charges. Failure to do so will result in an additional fee.

What is my daily/weekly/monthly mileage limit?
Daily and weekend rentals include 200 miles free per day, weekly rentals include 1,000 miles and monthly rentals include 3,000 miles free, unless stated otherwise. Each additional mile driven will be subject to a charge at the stated mileage rate.

I only want it for one day on the weekend. Can I do that?
Because of the huge demand we get for weekend rentals, Real Car isn’t able to guarantee one-day rentals on Fridays, Saturdays or Sundays in advance.
If you definitely need that car for a single day special event over the weekend, the only way to guarantee availability is to book for an entire weekend (Friday-Sunday, 72 hours or more).
Real Car does offer “non-guaranteed” (i.e. stand-by) one-day rentals on weekends. Please give us a call on the morning of, and if the car you want is available, we’ll gladly rent it to you same-day for just that single day.

Am I responsible for a flat tire?
Yes. Unfortunately, flat tires are a fact of life in driving cars, and you, as a renter, are responsible for any flat tire that occurs during the reservation, as well as any related damage that may result from that flat tire.
The only exception to this policy is if it is professionally documented that the flat is the result of a tire that was either 1) defective, or 2) had been subject to excessive wear such that it was unsafe to be driven as of the start of the reservation.
In the event of a flat, the renter should use the spare tire, and then coordinate with Real Car to determine how to resolve the issue. Repair may, in some instances, be appropriate; if the sidewall is damaged or a repair is not possible, the renter is responsible for replacement of that tire, but is not responsible for replacement of any of the non-damaged tires. The renter needs to receive approval from Real Car for a replacement tire, and must replace the tire with one of equal or greater quality.

Will the insurance or coverage I have through my credit card cover my Real Car rental?
American Express offers a program called “Premium Car Rental Protection.” This service is available directly from American Express and provides coverage for your GDC rental vehicle. This is option may be purchased in addition to your regular insurance policy, providing an extra layer of protection. Please carefully review the terms provided by the credit card, and ask them if you have any questions about the specifics of their coverage.

I returned the car, and Real Car didn’t mention that there was any problem, but now I’m being told that there was damage to the car. What should I do?
While you’re renting the car, you’re responsible for any damage that might occur. The best way to ensure you have no liability is to document the condition of the car at the beginning and end of the reservation with Real Car. You can do that with the rental checklist, and you may also email pictures of any damage to hello@realcar.nyc at the start and end of the reservation.

When do I pay for the trip?
You will be charged for your trip when the rental is booked. If you incur additional fees such as mileage overages, parking tickets, cleaning fees, etc. you will be charged after the trip ends. We will charge to the card on file, so please make sure that you have the proper funds available.

Are pets allowed in the car?
Pets are not allowed in the cars without Real Car’s explicit consent. If Real Car detects that a renter has transported a pet without proper authorization, the renter will be subject to additional fees.

Fees & Fines
Excess Mileage Fee
$0.75 per excess mile driven

Late Return Fee
50$/30 mins, started in 30 mins of your late

Gas Fee
Cost to replace gas not refilled

Toll Fee
Cost of toll (including governmental charges)

Ticket Fee
Cost of ticket (including governmental charges)

Cleaning Fee
Up to $250

Pet Fee
Up to $250

Smoking Fee
Up to $250

Who is responsible for normal “wear and tear” of the vehicle?
Normal “wear and tear” that is part of the normal operation of a vehicle is an inherent part of renting out a car; the renter is not responsible for wear and tear resulting for normal usage of the car. Wear and tear may include engine wear, brake and suspension wear, weathering of the paint or minor scuffing of the interior surfaces, as well as small (less than 2 inches in length) nicks, scratches, abrasions or dents to the exterior (including wheels) normally associated with street parking, shopping cart bumps, and the like.
However, renters are fully responsible for, and Real Car does not provide any protection to renters for 1) any damage related to “misuse” or Prohibited Uses of the vehicle, 2) any damage to the interior of the car, or 3) any mechanical damage resulting from a renter’s improper driving (e.g., clutch damage from rough driving, suspension damage from running over speed bumps at high speed or into curbs, continuing to drive with warning indicator lights illuminated, etc).')

  end
end
context 'Terms and Conditions tab ' do
    it 'is opened and text is present' do
      visit('https://staging.realcar.nyc/fleet')
      click_on ('About')
      click_on ('Terms and Conditions')
      expect(page).to have_content ("RENTAL AGREEMENT TERMS AND CONDITIONS

1. Definitions.“Agreement” means all terms and conditions found in this form and on the document titled Face Page. “You” or “your” means the person identified as the renter in this Agreement, each person signing this Agreement, each Authorized Driver and each person or organization to whom charges are billed by us at its or the renter’s direction. All persons referred to as “you’ or “your” are jointly and severally bound by this Agreement. “We”, “our” or “us” means the business organization named in this Agreement that is renting the Vehicle to you. “Authorized Driver” means the renter and each additional driver listed by us on this Agreement, provided that each such person has a valid driver’s license and is at least age 21. Only Authorized Drivers are permitted to operate the Vehicle ‘‘Vehicle” means the automobile or truck identified in this Agreement and each vehicle we substitute for it, and all its tires, tools, accessories, equipment, keys and Vehicle documents. This Vehicle may be equipped with an electronic locator device. “CDW” means Collision Damage Waiver. “Physical Damage” means damage to, or loss of, the Vehicle caused by collision or upset. Physical Damage does not include comprehensive damage such as damage to or loss of the Vehicle due to theft, vandalism, act of nature, riot or civil disturbance, hail, flood or fire or other loss not caused by collision or upset. “Loss of Use” means the loss of our ability to use the Vehicle for any purpose due to damage to it or loss of it during this rental, including uses other than for rental, such as display for rent, display for sale, opportunity to upgrade, opportunity to sell, or transportation of employees. Damages for Loss of Use are often difficult to determine with precision. Therefore, you and we agree that Loss of Use will be calculated by multiplying the number of days from the date the Vehicle is damaged until it is replaced or repaired times 80% of the daily rental rate. You and we agree this formula represents a reasonable estimate of actual damages and not a penalty. “Diminished Value” means the actual cash value of the Vehicle just prior to damage or loss less the value of the Vehicle after repair or replacement. “Vehicle License Cost Recovery Fee” means our good faith estimate of the daily charge necessary for to recover our actual total annual costs to license, title, register, plate, inspect or pay excise tax costs on our rental fleet in the Commonwealth of Massachusetts.

2. Rental, Indemnity and Warranties.This is a contract for rental of the Vehicle. We may repossess the Vehicle at your expense without notice to you, if the Vehicle is abandoned or used in violation of law or this Agreement. You agree to indemnify us, defend us and hold us harmless from all claims, liability, costs and attorney fees we incur resulting from or arising out of this rental and your use of the Vehicle. We make no warranties, express, implied or apparent, regarding the Vehicle, no warranty of merchantability and no warranty that the Vehicle is fit for a particular purpose.

3. Condition and Return of Vehicle.You must return the Vehicle to the location specified in this Agreement, on the date and time specified in this Agreement, and in the same condition that you received it except for ordinary wear. If You return the Vehicle more than 1 hour after the date and time specified in this Agreement, You will be charged for an additional half day of rental. If You return the Vehicle more than 3 hours after the date and time specified in this Agreement, You will be charged for an additional full day of rental. Service to the Vehicle or replacement of parts or accessories during the rental must have our prior approval. You must check and maintain all fluid levels and return the Vehicle with the same amount of fuel as when rented.

4. Delivery and Return with a Concierge.If a concierge has already been dispatched to deliver or pick up a Vehicle, You have up to 30 minutes to meet him at the location and time specified in this Agreement. After 30 minutes grace period, You will incur a charge of $50 and an additional charge of $50 per every half hour after that until You arrive.

5. Responsibility for Damage or Loss; Reporting to Police; Responsibility for Tolls and Traffic Violations.You are responsible for all damage to, or loss or theft of, the Vehicle, including damage caused by weather, road conditions and acts of nature, whether or not you are at fault. You are responsible for the cost of repair, or the actual cash retail value of the Vehicle on the date of the loss if the Vehicle is not repairable or if we elect not to repair the Vehicle. You are also responsible for Loss of Use, Diminished Value, and our administrative expenses incurred processing the claim. You must report all accidents or incidents of theft and vandalism to us and the police as soon as you discover them. You are responsible for paying to the appropriate 3rd party all tolls, parking, traffic and toll violations, toll evasion fines, citations, other fees, penalties, forfeitures, court costs, towing, and storage charges occurring during this rental. If you fail to pay the charging entities and we pay all or any of the charges on your behalf, you will reimburse us for all such costs and, in addition, pay us an administrative fee of $50 for each such charge.

6. Collision Damage Waiver.If you purchase CDW, we waive your responsibility for a portion of Physical Damage to the Vehicle. We will not waive this right if the Vehicle was rented or an Authorized Driver was approved as a result of fraudulent information provided to us, or if the damage or loss: (a) is caused intentionally, willfully or wantonly by an Authorized Driver; (b) occurs while an Authorized Driver operates the Vehicle while legally intoxicated or under the influence of any illegal drug or chemical as defined and determined under the law of the State where the damage occurs; (c) is caused while you are engaged in any speed contest; (d) occurs while pushing or towing anything, or carrying persons or property for hire, unless specifically authorized elsewhere in this Agreement; (e) occurs while the Vehicle is being driven outside the United States or Canada, unless specifically authorized elsewhere in this Agreement; (f) occurs while the Vehicle is being driven, with the renter’s permission or accession, by anyone other than an Authorized Driver; (g) is a result of the commission of a felony by an Authorized Driver.

7. Injury to Others; Insurance.You are responsible for all injury, damage and loss you cause to others. You agree to provide liability, collision and comprehensive insurance covering you, us, and the Vehicle. Where state law requires us to provide auto liability insurance, or if you have no auto liability insurance, we provide auto liability insurance (the “Policy”) that is secondary to all other valid and collectible insurance whether primary, secondary, excess or contingent. The Policy provides bodily injury and property damage liability coverage with limits no higher than minimum levels prescribed by the vehicular financial responsibility laws of the State whose laws apply to the loss. You and we reject PIP, medical payments, no-fault and uninsured and under-insured motorist coverage, where permitted by law. The Policy is void if you breach this Agreement or if you fail to cooperate in a loss investigation conducted by us or our insurer. Giving the Vehicle to an unauthorized driver terminates coverage under the Policy.

8. Charges.You permit us to reserve against your credit/debit card at the time of rental a reasonable amount in addition to the estimated charges. You will pay us at or before the conclusion of this rental or on demand all charges noted on the Face Page of this Agreement, plus: (a) a mileage charge based on our experience if the odometer is tampered with or disconnected; (b) fuel and a refueling charge, if you return the Vehicle with less fuel than when rented; (c) a charge for the total cost of all tolls billed to your Vehicle's E-ZPass throughout the term of your rental; (d) all expenses we incur recovering the Vehicle, if it is not returned as promised; (e) all costs, including pre- and post-judgment attorney fees, we incur collecting payment from you or otherwise enforcing or defending our rights under this Agreement; (f) a 2% per month late payment fee, or the maximum amount allowed by law, on all amounts paid after the rental concludes; (g) $50 or the maximum amount permitted by law, whichever is greater, if you pay us with a check returned unpaid for any reason; and (h) a reasonable fee not to exceed $350 to clean the Vehicle if returned substantially less clean than when rented. All charges are subject to our final audit. If errors in computation of the charges are discovered after the close of this transaction, you authorize us to correct the charges with your credit/debit card issuer.

9. Deposit.We may use your deposit to pay all amounts owed to us under this Agreement.

10. Your Property.You release us, our agents and employees from all claims for loss of and damage to your personal property or that of another person, that we received, handled or stored, or that was left or carried in or on the Vehicle or in a service vehicle or in our offices, whether or not the loss or damage was caused by our negligence or was otherwise our responsibility.

11. Breach of Agreement.The acts listed in paragraph 5, above, are prohibited uses of the Vehicle and breaches of this Agreement. You waive all recourse against us for criminal reports or prosecutions that we take against you that arise out of your breach of this Agreement.

12. Extension of Rental Period.If you wish to extend the rental period, you must submit a request in the \"My Account\" menu of the RealCar website (www.realcar.nyc) by using the \"extend my order\" function; all requests for any extensions to the term of your order are subject to our approval. If we have not approved the requested rental extension, the Vehicle must be returned at the date and time and location specified by the initial Agreement. This Agreement constitutes the entire agreement between you and us. All prior representations and agreements between you and us regarding this rental are void.

13. Miscellaneous.A waiver by us of a breach of this Agreement is not a waiver of an additional breach or waiver of the performance of your obligations under this Agreement. Our acceptance of payment from you or our failure, refusal or neglect to exercise our rights under this Agreement does not constitute a waiver of any other provision of this Agreement. Unless prohibited by law, you release us from all liability for consequential, special or punitive damages in connection with this rental or the reservation of a vehicle. If a provision of this Agreement is deemed void or unenforceable, the remaining provisions are valid and enforceable.

CONTACT INFO
HELLO@REALCAR.NYC
+1 (781) 626-1186
CUSTOMER SUPPORT
FAQ
TERMS & CONDITIONS
CONNECT
FACEBOOK
INSTAGRAM
TURO
YELP
© 2016 REAL CAR. ALL RIGHTS RESERVED. LWAIDLICH.COM
")
    end
  end
end
