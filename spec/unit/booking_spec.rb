require 'user'
require 'booking'

describe Booking do
  # describe '.all' do
  #   it 'returns all bookings' do
  #     User.create("john", "john@example.com", "V3ryS3cur3P4ssw0rd")
  #     Space.create('Blessing Apartment', 'Beautiful three bedroom house', "500", User.current.id)
      
  #     check_in = Date.today
  #     check_out = check_in.next_month
      
  #     Booking.create(check_in, check_out, Space.current.id)
  #     Booking.create(check_out, check_out.next_month, Space.current.id)

  #     bookings = Booking.all

  #     expect(bookings.length).to eq 2
      
  #     expect(bookings.first).to be_a booking
  #     expect(bookings.first.check_in).to eq check_in
  #     expect(bookings.first.check_out).to eq check_out
  #     expect(bookings.first.space_id).to eq Space.current.id

  #     expect(bookings.last).to be_a booking
  #     expect(bookings.last.check_in).to eq check_out
  #     expect(bookings.last.check_out).to eq check_out.next_month
  #     expect(bookings.last.space_id).to eq Space.current.id
  #   end
  # end

  describe '.create' do
    it 'creates a new booking object with required parameters' do
      check_in = Date.today
      check_out = check_in.next_month
      
      User.create("john", "john@example.com", "V3ryS3cur3P4ssw0rd")
      Space.create('Blessing Apartment', 'Beautiful three bedroom house', "500", User.current.id)
      Booking.create(check_in, check_out, Space.current.id)

      check_in_formatted = check_in.strftime("%Y-%m-%d")
      check_out_formatted = check_out.strftime("%Y-%m-%d")

      expect(Booking.current.check_in).to eq check_in_formatted
      expect(Booking.current.check_out).to eq check_out_formatted
      expect(Booking.current.space_id).to eq Space.current.id
    end
  end

  describe '.current' do
    it 'returns the current instance of booking class' do
      check_in = Date.today
      check_out = check_in.next_month
      
      User.create("john", "john@example.com", "V3ryS3cur3P4ssw0rd")
      Space.create('Blessing Apartment', 'Beautiful three bedroom house', "500", User.current.id)
      Booking.create(check_in, check_out, Space.current.id)

      expect(Booking.current).to be_a Booking
    end
  end
end
