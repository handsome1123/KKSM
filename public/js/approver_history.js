// get user
async function getUser() {
    try {
        const response = await fetch('/userInfo');
        if (response.ok) {
            const data = await response.json();
            document.querySelector('#username').textContent = data.username;
        }
        else if (response.status == 500) {
            const data = await response.text();
            throw Error(data);
        }
        else {
            throw Error('Connection error');
        }
    } catch (err) {
        console.error(err.message);
        Notiflix.Report.failure('Error', err.message, 'Close');
    }
}

// get order list from database
async function getBooking() {
    try {
        const response = await fetch('/user/booking');
        if (response.ok) {
            const data = await response.json();
            showBooking(data);
        }
        else if (response.status == 500) {
            const data = await response.text();
            throw Error(data);
        }
        else {
            throw Error('Connection error');
        }
    } catch (err) {
        console.error(err.message);
        Notiflix.Report.failure('Error', err.message, 'Close');
    }
}

// show product table
function showBooking(data) {
    const tbody = document.querySelector('#tbody');
    let temp = '';
    data.forEach(function(booking) {
        temp += `<tr>`;
        temp += `<td>${booking.BookingID}</td>`;
        temp += `<td>${booking.RoomID}</td>`;
        temp += `<td>${new Date(booking.BookingDate).toLocaleDateString()}</td>`;
        temp += `<td>${booking.TimeSlot}</td>`;
        temp += `<td>${booking.Username}</td>`;
        temp += `<td>${booking.UserID}</td>`;
        temp += `<td>${booking.Status}</td>`;
        temp += `</tr>`;
    });
    tbody.innerHTML = temp;
}



// get user info
getUser();
// get and show order
getBooking();