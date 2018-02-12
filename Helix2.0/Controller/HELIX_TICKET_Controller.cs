using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Helix2._0.Model;

namespace Helix2._0.Controller
{
    public class HELIX_TICKET_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_TICKET_
        public IQueryable<HELIX_TICKET> GetHELIX_TICKET()
        {
            return db.HELIX_TICKET;
        }

        // GET: api/HELIX_TICKET_/5
        [ResponseType(typeof(HELIX_TICKET))]
        public IHttpActionResult GetHELIX_TICKET(int id)
        {
            HELIX_TICKET hELIX_TICKET = db.HELIX_TICKET.Find(id);
            if (hELIX_TICKET == null)
            {
                return NotFound();
            }

            return Ok(hELIX_TICKET);
        }

        // PUT: api/HELIX_TICKET_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_TICKET(int id, HELIX_TICKET hELIX_TICKET)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_TICKET.ID_CLIENTE)
            {
                return BadRequest();
            }

            db.Entry(hELIX_TICKET).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_TICKETExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/HELIX_TICKET_
        [ResponseType(typeof(HELIX_TICKET))]
        public IHttpActionResult PostHELIX_TICKET(HELIX_TICKET hELIX_TICKET)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_TICKET.Add(hELIX_TICKET);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (HELIX_TICKETExists(hELIX_TICKET.ID_CLIENTE))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = hELIX_TICKET.ID_CLIENTE }, hELIX_TICKET);
        }

        // DELETE: api/HELIX_TICKET_/5
        [ResponseType(typeof(HELIX_TICKET))]
        public IHttpActionResult DeleteHELIX_TICKET(int id)
        {
            HELIX_TICKET hELIX_TICKET = db.HELIX_TICKET.Find(id);
            if (hELIX_TICKET == null)
            {
                return NotFound();
            }

            db.HELIX_TICKET.Remove(hELIX_TICKET);
            db.SaveChanges();

            return Ok(hELIX_TICKET);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_TICKETExists(int id)
        {
            return db.HELIX_TICKET.Count(e => e.ID_CLIENTE == id) > 0;
        }
    }
}